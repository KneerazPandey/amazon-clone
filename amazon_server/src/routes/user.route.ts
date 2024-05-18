import { Router } from "express";
import UserController from "../controllers/user.controller";
import { authMiddleware } from "../middlewares/auth.middleware";


const controller = new UserController();

const userRouter = Router();

userRouter.post('/register', controller.register);

userRouter.post('/login', controller.login);

userRouter.post('/verify-token', controller.validateToken);

userRouter.get('/data', authMiddleware, controller.getUserData);

export default userRouter;