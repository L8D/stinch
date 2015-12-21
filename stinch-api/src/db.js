import Promise from 'bluebird';
import {dependencies} from 'yokohama';
import {Request, Response, NotFoundError} from 'osaka';

export class DbConn {};

@dependencies(DbConn)
export class DbClient {
    constructor(conn) {
        this.conn = conn;
    }

    run(query) {
        const {text, values} = query.toQuery();

        return Promise.fromCallback(cb => {
            this.conn.query(text, values, cb);
        }).then(results => {
            return results.rows;
        });
    }

    find(query) {
        return this.run(query.limit(1)).then(rows => {
            if (rows.length >= 1) {
                return rows[0];
            } else {
                throw new NotFoundError('No rows returned');
            }
        });
    }
}
