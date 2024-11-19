const { EntitySchema } = require('typeorm');

module.exports = new EntitySchema({
  name: 'StudentRegistration',
  tableName: 'student_registration',
  columns: {
    UE_ID: {
      type: 'varchar',
      primary: true,
      length: 50,
    },
    Registration_Type: {
      type: 'char',
      nullable: true,
    },
    Salutation_E: {
      type: 'tinyint',
      nullable: true,
    },
    Salutation_H: {
      type: 'tinyint',
      nullable: true,
    },
    Student_First_Name_E: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    Student_Middle_Name_E: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    Student_Last_Name_E: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    Student_First_Name_H: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    Student_Middle_Name_H: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    Student_Last_Name_H: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    DOB: {
      type: 'date',
      nullable: true,
    },
    Gender_Id: {
      type: 'char',
      length: 1,
      nullable: true,
    },
    Mobile_No: {
      type: 'varchar',
      length: 12,
      nullable: true,
    },
    Email_Id: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    Father_Name_E: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    Mother_Name_E: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    Father_Name_H: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    Mother_Name_H: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    Guardian_Name_E: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    Spouse_Name_E: {
      type: 'varchar',
      length: 50,
      nullable: true,
    },
    profilephoto_Url: {
      type: 'varchar',
      length: 2000,
      nullable: true,
    },
    Created_By: {
      type: 'varchar',
      length: 20,
      nullable: true,
    },
    Created_Date: {
      type: 'datetime',
      nullable: true,
    },
    Modified_By: {
      type: 'varchar',
      length: 20,
      nullable: true,
    },
    Modified_Date: {
      type: 'datetime',
      nullable: true,
    },
    Delete_Flag: {
      type: 'char',
      length: 1,
      nullable: true,
    },
    Public_IP_Address: {
      type: 'varchar',
      length: 20,
      nullable: true,
    },
    Private_IP_Address: {
      type: 'varchar',
      length: 20,
      nullable: true,
    }
  }
});
