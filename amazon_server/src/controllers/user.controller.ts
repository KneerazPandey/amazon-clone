import { Request, Response } from "express";
import { User } from "../models/user.model";
import Hashing from "../utils/hashing";
import Tokens from "../utils/tokens";
import jwt from 'jsonwebtoken';



export default class UserController {

    public async register(req: Request, res: Response) {
        try {

            const { name, email, password } = req.body;
            if (!name || !email || !password) {
                return res.status(404).json({error: "All fields are required."});
            }
            const existingUser = await User.findOne({email});
            if (existingUser) {
                return res.status(400).json({msg: "User with same email already exists"});  
            }
            const hashPassword = await Hashing.hashPassword(password);
            var user = new User({
                name, email, password: hashPassword,
            });
            user = await user.save();
            return res.json(user);
        }catch(error) {
            return res.status(500).json({error: error});
        }
    }

    public async login(req: Request, res: Response) {
        try {
            const { email, password } = req.body;
            if (!email || !password) {
                return res.status(404).json({error: 'Email and password are required.'});
            }
            let user = await User.findOne({email});
            if (!user) {
                return res.status(404).json({error: 'Email and password did not match'}); 
            }
            const isPasswordMatch = await Hashing.checkPassword(password, user.password);
            if (!isPasswordMatch) {
                return res.status(404).json({error: 'Email and password did not match'}); 
            }
            const token = await Tokens.generate(user._id.toString());
            const data = user.toJSON();
            return res.json({token, ...data});

        }catch(error) {
            return res.status(500).json({error: error});
        }
    }

    public async validateToken(req: Request, res: Response) {
        try {
            const token = req.header('Authorization');
            if (!token) {
                return res.status(500).json(false);
            }
            const verified: jwt.JwtPayload | string = await jwt.verify(token, process.env.SECRET_KEY as string);
            if (!verified || typeof verified == 'string') {
                return res.status(500).json(false);
            }
            const user = await User.findById(verified.id);
            if (!user) {
                return res.status(500).json(false);
            }
            return res.status(200).json(true);
        }catch(error) {
            return res.status(500).json(false);
        }
    }

    public async getUserData(req: Request, res: Response) {
        const user = await User.findById((req as any).user.id);
        const token = (req as any).token;
        const data = user?.toJSON();
        return res.status(200).json({...data, token});
    }

}