import { Document, Schema, model } from "mongoose";


interface IUser extends Document {
    name: string;
    email: string;
    password: string;
    address: string;
    type: string;
}


const UserSchema = new Schema<IUser>({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    email: {
        type: String,
        required: true,
        trim: true,
        validate: {
            validator: (value: string) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "Please enter a valid email address"
        }
    },
    password: {
        type: String,
        required: true,
        validate: {
            validator: (value: string) => {
                return value.length >= 5;
            },
            message: "Password must be greater then 5 character"
        }
    },
    address: {
        type: String,
        required: false,
        default: "",
    },
    type: {
        type: String,
        default: "user",
    }
});


const User = model<IUser>("User", UserSchema);

export {
    User, 
    IUser
};