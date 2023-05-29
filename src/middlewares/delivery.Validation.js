import { deliverySchema } from "../schemas/delivery.Schema.js";

export function deliveryValidation(req,res,next){

    const validation = deliverySchema.validate(req.body, { abortEarly: false });

    if (validation.error) {
        const errors = validation.error.details.map((detail) => detail.message);
        return res.status(422).send(errors);
    }
    next()
}