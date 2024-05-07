import App from "./app";
import 'dotenv/config';

const PORT: number = parseInt(process.env.PORT as string);

const app = new App(PORT);
app.run();