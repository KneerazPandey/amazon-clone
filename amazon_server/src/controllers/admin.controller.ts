import { Request, Response } from "express";
import Product from "../models/product.model";

export default class AdminController {

    public async addProduct(req: Request, res: Response) {
        try {
            const { name, description, images, quantity, price, category } = req.body;
            let product = new Product({
                name, description, images, price, quantity, category
            });
            product = await product.save();
            return res.status(200).json(product.toJSON());
        }catch(error: any) {
            return res.status(500).json({error: error.message});
        }
    }

    public async getProducts(req: Request, res: Response) {
        try {
            const products = await Product.find();
            return res.status(200).json(products);
        }catch(error: any) {
            return res.status(400).json({error: error.message});
        }
    }
}