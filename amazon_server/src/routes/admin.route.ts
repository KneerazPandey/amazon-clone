import { Router } from "express";
import AdminController from "../controllers/admin.controller";
import { adminMiddleware } from "../middlewares/admin.middleware";

const controller = new AdminController();

const adminRouter = Router();

adminRouter.post('/add-product', adminMiddleware, controller.addProduct);

adminRouter.get('/get-products', adminMiddleware, controller.getProducts);

adminRouter.delete('/delete-product', adminMiddleware, controller.deleteProduct);

export default adminRouter;