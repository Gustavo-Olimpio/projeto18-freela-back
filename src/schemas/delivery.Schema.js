import joi from 'joi'

export const deliverySchema = joi.object({
    classId: joi.number().positive().required(),
    studentId: joi.number().positive().required(),
    projectId: joi.number().positive().required(),
    link: joi.string().uri().required()
  });