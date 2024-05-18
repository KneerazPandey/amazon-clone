import { NextFunction, Request, Response } from 'express';
import jwt from 'jsonwebtoken';
import { User } from '../models/user.model';


export const authMiddleware = async (req: Request, res: Response, next: NextFunction) => {
    try {
        let token = req.header('Authorization');
        if (!token) {
            return res.status(401).json({error: 'Access Denied. Please login first'});
        }
        const datas = token.split(' ')
        
        if (datas.length != 2) {
            return res.status(401).json({error: 'Access Denied. Please login first'});
        }

        const header = datas[0]
        if (header !== 'Bearer') {
            return res.status(401).json({error: 'Access Denied. Please login first'});
        }
        token = datas[1];
        const verified: string | jwt.JwtPayload = await jwt.verify(token, process.env.SECRET_KEY as string);
        if (!verified || typeof verified == 'string') {
            return res.status(401).json({error: 'Access Denied. Please login first'});
        }
        const user = await User.findById(verified.id);
        if (!user) {
            return res.status(401).json({error: 'Access Denied. Please login first'});
        }    
        (req as any).user = user;
        (req as any).token = token;
        next();
    }catch(error: any) {
        return res.status(500).json({error: error.message});
    }
}