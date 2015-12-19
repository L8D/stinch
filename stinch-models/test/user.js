import expect from 'expect';

import {User} from '../src/user';

describe('User.parse', function() {
    it('should parse created_at and updated_at timestamps', function() {
        const user = User.parse({
            id: '87d5aab8-a69d-11e5-afa5-ef254224ff49',
            name: 'John Doe',
            email: 'john.doe@example.com',
            created_at: '2015-12-19T22:13:04.451Z',
            updated_at: '2015-12-19T22:13:11.463Z'
        });

        expect(user.created_at).toBeA(Date);
        expect(user.updated_at).toBeA(Date);
    });
});
