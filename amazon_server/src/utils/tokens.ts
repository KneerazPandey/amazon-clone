import jwt from 'jsonwebtoken';

export default class Tokens {

    public static generate = async (payload: string) : Promise<string> => {
        const SECRET_KEY: string = process.env.SECRET_KEY as string;
        return jwt.sign({id: payload}, SECRET_KEY);
    }

}