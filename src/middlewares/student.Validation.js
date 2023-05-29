import { studentSchema } from "../schemas/students.Schema.js";

export function studentValidation(req,res,next){

    const validation = studentSchema.validate(req.body, { abortEarly: false });

    if (validation.error) {
        const errors = validation.error.details.map((detail) => detail.message);
        return res.status(422).send(errors);
    }
    next()
}