import bcryptjs from 'bcryptjs';

export default class Hashing {

    public static hashPassword = async (password: string) : Promise<string> => {
        const SECRET_KEY: string = process.env.SECRET_KEY as string;
        return await bcryptjs.hash(SECRET_KEY, 10);
    }
}