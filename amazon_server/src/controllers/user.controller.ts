import { Request, Response } from "express";
import User from "../models/user.model";
import Hashing from "../utils/hashing";


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

}