import {Controller, Request, Response} from 'osaka';
import {dependencies} from 'yokohama';
import {select} from 'sql';

import {User} from 'stinch-models';
import {users} from 'stinch-db';

import {DbClient} from '../db';

@dependencies(Request, Response, DbClient)
export class UsersController extends Controller {
    constructor(req, res, client) {
        super(req, res);

        this.client = client;
    }

    list(limit, offset) {
        const query = select(users.star())
            .from(users)
            .order(users.created_at)
            .limit(limit)
            .offset(offset);

        return this.client.run(query).map(User.parse);
    }

    show(id) {
        const query = select(users.star())
            .from(users)
            .where(users.id.equals(id));

        return this.client.find(query).then(User.parse);
    }
}
