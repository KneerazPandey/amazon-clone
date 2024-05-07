import { Router } from "express";
import UserController from "../controllers/user.controller";


const controller = new UserController();

const userRouter = Router();

userRouter.post('/register', controller.register);

export default userRouter;