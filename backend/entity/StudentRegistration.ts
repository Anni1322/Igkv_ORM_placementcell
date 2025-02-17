import { Entity, Column, PrimaryColumn } from 'typeorm';

@Entity('student_registration')
export class StudentRegistration {
  @PrimaryColumn({ type: 'varchar', length: 50 })
  UE_ID: string;

  @Column({ type: 'char', nullable: true })
  Registration_Type: string;

  @Column({ type: 'tinyint', nullable: true })
  Salutation_E: number;

  @Column({ type: 'tinyint', nullable: true })
  Salutation_H: number;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Student_First_Name_E: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Student_Middle_Name_E: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Student_Last_Name_E: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Student_First_Name_H: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Student_Middle_Name_H: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Student_Last_Name_H: string;

  @Column({ type: 'date', nullable: true })
  DOB: Date;

  @Column({ type: 'char', nullable: true })
  Gender_Id: string;

  @Column({ type: 'varchar', length: 12, nullable: true })
  Mobile_No: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Email_Id: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Father_Name_E: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Mother_Name_E: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Father_Name_H: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Mother_Name_H: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Guardian_Name_E: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  Spouse_Name_E: string;

  @Column({ type: 'varchar', length: 2000, nullable: true })
  profilephoto_Url: string;

  @Column({ type: 'varchar', length: 20, nullable: true })
  Created_By: string;

  @Column({ type: 'datetime', nullable: true })
  Created_Date: Date;

  @Column({ type: 'varchar', length: 20, nullable: true })
  Modified_By: string;

  @Column({ type: 'datetime', nullable: true })
  Modified_Date: Date;

  @Column({ type: 'char', nullable: true })
  Delete_Flag: string;

  @Column({ type: 'varchar', length: 20, nullable: true })
  Public_IP_Address: string;

  @Column({ type: 'varchar', length: 20, nullable: true })
  Private_IP_Address: string;
}
