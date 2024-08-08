import { Request, Response, NextFunction } from "express";


export const pathMiddleware = (req: Request, res: Response, next: NextFunction) => {
    console.log(`Router Path: ${req.url}`);
    next();
}