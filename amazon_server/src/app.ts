import express, { Application } from 'express';
import cors from 'cors';
import mongoose from 'mongoose';
import router from './routes/route';
import { pathMiddleware } from './middlewares/path.middleware';


export default class App {
    public express: Application;
    public port: number;
    public host: string;

    constructor() {
        this.port = parseInt(process.env.PORT as string);
        this.host = process.env.HOST as string;
        this.express = express();

        this.initializeMiddleware();
        this.connectDatabase();
        this.registerRoute();
    }

    private initializeMiddleware() {
        this.express.use(express.json());
        this.express.use(express.urlencoded({extended: true}));
        this.express.use(cors());
        this.express.use(pathMiddleware);
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
        this.express.listen(this.port,  this.host,() => {
            console.log(`Server is listning at http://${this.host}:${this.port}`);
        });
    }

}