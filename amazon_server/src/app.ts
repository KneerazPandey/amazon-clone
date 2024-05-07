import express, { Application } from 'express';
import cors from 'cors';
import mongoose from 'mongoose';
import router from './routes/route';


export default class App {
    public express: Application;
    public port: number;

    constructor() {
        this.port = parseInt(process.env.PORT as string);
        this.express = express();

        this.initializeMiddleware();
        this.connectDatabase();
        this.registerRoute();
    }

    private initializeMiddleware() {
        this.express.use(express.json());
        this.express.use(express.urlencoded({extended: true}));
        this.express.use(cors());
    }

    private registerRoute() {
        this.express.use('/api', router);
    }

    private connectDatabase() {
        const DB_URI: string = process.env.DB_URI as string;
        mongoose.connect(DB_URI).then(() => {
            console.log('Successfully Connected to database');
        }).catch((error) => {
            console.log('Unable to connect to database.', error);
        });

    }

    public run() {
        this.express.listen(this.port, () => {
            console.log(`Server is listning at http://localhost:${this.port}`);
        });
    }

}