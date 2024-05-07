import express, { Application } from 'express';
import cors from 'cors';
import mongoose from 'mongoose';


export default class App {
    public express: Application;
    public port: number;

    constructor(port: number) {
        this.port = port;
        this.express = express();

        this.initializeMiddleware();
        this.connectDatabase();
    }

    private initializeMiddleware() {
        this.express.use(express.json());
        this.express.use(express.urlencoded({extended: true}));
        this.express.use(cors());
    }

    private connectDatabase() {
        const DB_URI: string = process.env.DB_URI as string;
        mongoose.connect(DB_URI).then(() => {
            console.log('Successfully Connected to database');
        }).catch((error) => {
            console.log('Unable to connect to database.');
        });

    }

    public run() {
        this.express.listen(this.port, () => {
            console.log(`Server is listning at http://localhost:${this.port}`);
        });
    }

}