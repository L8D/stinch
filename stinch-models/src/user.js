export class User {
    static parse(attrs) {
        return new User({
            ...attrs,
            created_at: new Date(attrs.created_at),
            updated_at: new Date(attrs.updated_at)
        });
    }

    constructor(attrs) {
        const {
            id,
            name,
            email,
            created_at,
            updated_at
        } = attrs;

        this.id = id;
        this.name = name;
        this.email = email;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
}
