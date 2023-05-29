import { db } from "../database.connection.js";

export async function postDelivery(req, res) {
    const {classId,studentId,projectId,link} = req.body
    try{
        await db.query(`INSERT INTO delivery("classId","studentId","projectId",link) VALUES ($1,$2,$3,$4);`,[classId,studentId,projectId,link])
        res.sendStatus(201)
        } catch (err) {
        return res.status(500).send(err.message);
        }
}

export async function getProjects(req, res) {
    const {idClass,idProject} = req.params
    try{
        const students = await db.query(`SELECT delivery.id,students.name,students.image,delivery.grade,delivery.link,classes.class,projects.project FROM delivery JOIN students ON students.id = delivery."studentId" JOIN classes ON classes.id= delivery."classId" JOIN projects ON projects.id=delivery."projectId" WHERE delivery."classId"=$1 AND delivery."projectId"=$2`,[idClass,idProject])
        res.status(200).send(students.rows)
        } catch (err) {
        return res.status(500).send(err.message);
        }
}

export async function putGrade(req, res) {
    const {grade} = req.body
    const {id} = req.params
    try{
        await db.query(`UPDATE delivery SET "grade"='${grade}' WHERE id=$1;`,[id])
        res.status(200).send("OK")
        } catch (err) {
        return res.status(500).send(err.message);
        }
}