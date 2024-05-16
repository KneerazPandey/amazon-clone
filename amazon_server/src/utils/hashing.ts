import bcryptjs from 'bcryptjs';

export default class Hashing {

    public static hashPassword = async (password: string) : Promise<string> => {
        return await bcryptjs.hash(password, 10);
    }

    public static checkPassword = async (password: string, hashPassword: string) : Promise<boolean> => {
        return await bcryptjs.compare(password, hashPassword);
    }
}