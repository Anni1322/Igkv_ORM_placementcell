import { Component } from '@angular/core';
import { CServiceService } from '../../company/service/c-service.service';
import { StudentService } from 'src/app/services/student.service';

@Component({
  selector: 'app-s-dashboard',
  templateUrl: './s-dashboard.component.html',
  styleUrls: ['./s-dashboard.component.scss']
})
export class SDashboardComponent {
  user:any;
  data:any;
  vacancyApplications:any;
  applicationcout:any;

  // for data decription
  baseimageur = 'http://localhost:3000/company';
  constructor(private vacancyService:CServiceService,  private studentds:StudentService){}
  ngOnInit() {
    const userString = localStorage.getItem('currentUser');
    if (userString !== null) {
      // Proceed only if userString is not null
      this.user = JSON.parse(userString); 
      // console.log('User ID:', userString);
      this.sendstudentid(this.user.eid);
    }


    this.vacancyService.getVacancies().subscribe(data => {
      this.data = data;
      // console.log(data)
      if (data.length > 0) {
        // console.log(data[0].Company_Id); 
      }
    });
};

      // Dynamically get the count
  getVacancyCount(): number {
    return this.data.length;
  }
  getApplicationCount(): number {
    return this.user.length;
  }
  getShortlistCount(): number {
    return this.user.length;
  }


  // for application cout 
  sendstudentid(eid:any){
    this.studentds.VacancyApplicationStudentDetail(eid).subscribe(
      (response) => {
        // console.log('Raw Response:', response);
        this.vacancyApplications = response;
        this.applicationcout = this.vacancyApplications.length;
        // console.log('student application details:', this.vacancyApplications);
        // console.log('student application details:', this.vacancyApplications);
        if (this.vacancyApplications) {
          // console.log('Vacancy_ID:', this.vacancyApplications.Vacancy_ID);
        } else {
          console.log('No eid  data received.');
        }
      },
      (error) => {
        console.log('Error:', error);
      })
    }
  
}
