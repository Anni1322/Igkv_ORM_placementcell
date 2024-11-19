// controller.js
const express = require('express');
const Student = require('../model/studentModel');
const bcrypt = require('bcrypt');
const sql = require('../config/db');
// const cors = require('cors');

// get ip
const os = require('os');
// end
 

// add on 22 august 
const getVacancyApply = async (req, res) => {
    try {
        const pool = await sql.connect();
        const request = pool.request();
        const query = `SELECT * FROM tnp_student_application_details`;
        const result = await request.query(query);
        const records = result.recordset;
        // Respond with the fetched records
        res.status(200).json(records);
    } catch (error) {
        console.error('Error fetching student application details:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
  };
  


//for all students applications
const Student_application_List = async (req, res) => {
    const { Company_Id } = req.body;
    // Company_Id = "COM04"
    // vid = 10
    // if (!eid) {
    //     return res.status(400).json({ error: 'eid is required' });
    // }
    console.log("com id ",Company_Id)
    try {
        const request = new sql.Request();
        request.input('Company_Id', sql.VarChar(50), Company_Id);
        const query = 'SELECT * FROM dbo.tnp_student_application_details WHERE Company_Id = @Company_Id';
       
        console.log('Executing query:', query, 'with eid:', Company_Id);
        const result = await request.query(query);
        if (result.recordset.length > 0) {
            res.json(result.recordset);
        } else {
            return res.status(404).json({ error: 'vacancy not found' });
        }
    } catch (error) {
        console.error('Error checking existence in SQL Server: ', error);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
};


// for short list
const getshortlist = async (req, res) => {
  try {
      const pool = await sql.connect();
      const request = pool.request();
      const query = `SELECT * FROM tnp_student_application_details WHERE Status = 'Short Listed'`;
      const result = await request.query(query);
      const records = result.recordset;
      // Respond with the fetched records
      res.status(200).json(records);
  } catch (error) {
      console.error('Error fetching student application details:', error);
      res.status(500).json({ error: 'Internal Server Error' });
  }
};

// for getReject
const getReject = async (req, res) => {
  try {
      const pool = await sql.connect();
      const request = pool.request();
      const query = `SELECT * FROM tnp_student_application_details WHERE Status = 'Not Seleted'`;
      const result = await request.query(query);
      const records = result.recordset;
      // Respond with the fetched records
      res.status(200).json(records);
  } catch (error) {
      console.error('Error fetching student application details:', error);
      res.status(500).json({ error: 'Internal Server Error' });
  }
};


// for getselected 
const getSelected = async (req, res) => {
    try {
      const pool = await sql.connect();
      const request = pool.request();
      // Query to fetch selected records
      const query = `SELECT * FROM tnp_student_application_details WHERE Status = 'Selected'`;
      const result = await request.query(query);
      const records = result.recordset;
      // Query to fetch count of selected records
      const countQuery = `SELECT COUNT(*) AS SelectedCount FROM tnp_student_application_details WHERE Status = 'Selected'`;
      const countResult = await request.query(countQuery);
      const selectedCount = countResult.recordset[0].SelectedCount;
      // Respond with both records and selectedCount
      res.status(200).json(records );
    } catch (error) {
      console.error('Error fetching student application details:', error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  };
  

// for update student application details 
const update_by_adminVacancyApply = async (req, res) => {
  const {
      Student_Application_ID,
      Vacancy_ID,
      Company_ID,
      Company_Name,
      Student_ID,
      Full_Name,
      Post_Name,
      Fathers_Name,
      Email,
      Mobile,
      //Flag,
      Status,
      Created_Date
  } = req.body;
 // console.log(Flag);
//   console.log(Student_Application_ID);
  const file = req.file; // Get the file from the request
  const Resume_Path = file ? file.path : null; // Get the file path
  try {
      const pool = await sql.connect(); // Connect to the database using the exported sql object
      const request = pool.request(); // Create a request object from the pool
      // Update student application details based on Student_ID
      const updateQuery = `
          UPDATE tnp_student_application_details
          SET
              Vacancy_ID = @Vacancy_ID,
              Company_ID = @Company_ID,
              Company_Name = @Company_Name,
              Full_Name = @Full_Name,
              Post_Name = @Post_Name,
              Fathers_Name = @Fathers_Name,
              Email = @Email,
              Mobile = @Mobile,
              Status = @Status,
              Created_Date = @Created_Date
          WHERE
                Student_Application_ID = @Student_Application_ID`;

      // Bind the values
      request.input('Student_Application_ID', sql.INT, Student_Application_ID);
      request.input('Vacancy_ID', sql.NVarChar(50), Vacancy_ID);
      request.input('Company_ID', sql.NVarChar(50), Company_ID);
      request.input('Company_Name', sql.NVarChar(50), Company_Name);
      request.input('Student_ID', sql.NVarChar(50), Student_ID);
      request.input('Full_Name', sql.NVarChar(100), Full_Name);
      request.input('Post_Name', sql.NVarChar(100), Post_Name);
      request.input('Fathers_Name', sql.NVarChar(100), Fathers_Name);
      request.input('Email', sql.NVarChar(100), Email);
      request.input('Mobile', sql.NVarChar(13), Mobile);
      //request.input('Flag', sql.Char(1), Flag);
      request.input('Status', sql.NVarChar(20), Status);
      request.input('Created_Date', sql.NVarChar(20), Created_Date);
      await request.query(updateQuery);
      // Respond with success message
      res.status(200).json({ message: 'Student application details updated successfully' });
  } catch (err) {
      console.error('Error updating student application details: ', err);
      res.status(500).json({ error: 'Internal Server Error' });
  }
};


// get all vac

const getVacanciesDetils = async (req, res) => {
    try {
        const pool = await sql.connect();
        const request = pool.request();
        const query = `SELECT * FROM tnp_vacancy_details`;
        const result = await request.query(query);
        const records = result.recordset;
        // Respond with the fetched records
        res.status(200).json(records);
    } catch (error) {
        console.error('Error fetching student application details:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
  };


const getstudentdetails = async (req, res) => {
    const eid = req.body.eid; // Assuming 'eid' is a field in the request body
    console.log(eid);
    try {
        var request = new sql.Request();
        request.input('eid', sql.VarChar, eid); // Adjust the SQL data type as necessary
        var query = 'SELECT * FROM dbo.login_table WHERE UE_ID = @eid';
        // Execute the SQL query
        request.query(query, (err, result) => {
            if (err) {
                console.log(err);
                res.status(500).json({ error: 'Error executing the query' });
                return;
            }
            // Send the fetched records as JSON response
            res.json(result.recordset);
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Unexpected server error' });
    }
};


const getAllStudents = async (req, res) => {
    try {
        const pool = await sql.connect();
        const request = pool.request();
        var query = "SELECT * FROM dbo.student_registration";
        const result = await request.query(query);
        const records = result.recordset;
        // Respond with the fetched records
        res.status(200).json(records);
    } catch (error) {
        console.error('Error fetching student application details:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
  };

const getAllCompany = async (req, res) => {
    try {
        const pool = await sql.connect();
        const request = pool.request();
        var query = "SELECT * FROM dbo.company_registration";
        const result = await request.query(query);
        const records = result.recordset;
        // Respond with the fetched records
        res.status(200).json(records);
    } catch (error) {
        console.error('Error fetching student application details:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
  };


// student list 
module.exports ={
  getVacancyApply,
  Student_application_List,
  update_by_adminVacancyApply,
  getVacanciesDetils,
  getstudentdetails,
  getshortlist,
  getSelected,
  getReject,
  getAllStudents,
  getAllCompany
}



