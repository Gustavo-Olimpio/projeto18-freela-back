import joi from 'joi'

export const studentSchema = joi.object({
    name: joi.string().required(),
    cpf:joi.string().min(11).max(11).required(),
    email:joi.string().email().required(),
    image: joi.string().uri().required(),
    classId: joi.number().positive().required()
  });