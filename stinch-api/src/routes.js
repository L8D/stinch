import {Router} from 'hiroshima';

import {UsersController} from './controllers/users';

export const router = new Router();

router.dir('users').call(router => {
    router
        .where({method: 'get'})
        .index(UsersController.list());

    router
        .where({method: 'post'})
        .index(UsersController.create());

    router.param('user_id').call(router => {
        router
            .where({method: 'get'})
            .index(UsersController.show('user_id'));

        router
            .where({method: 'put'})
            .index(UsersController.replace('user_id'));

        router
            .where({method: 'patch'})
            .index(UsersController.update('user_id'));

        router
            .where({method: 'delete'})
            .index(UsersController.remove('user_id'));
    });
});
