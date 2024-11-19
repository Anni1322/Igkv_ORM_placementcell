import { Component } from '@angular/core';
import { AdminService } from '../../admin/service/admin.service';
import { CServiceService } from '../service/c-service.service';

@Component({
  selector: 'app-c-dashboard',
  templateUrl: './c-dashboard.component.html',
  styleUrls: ['./c-dashboard.component.scss']
})
export class CDashboardComponent {

  cid:any;
  applicationlist:any;
  vacancylist:any;
  ShortList:any
  NextRoundList:any;
  Seletedlist:any;
  Rejectedlist:any;


  constructor(
    private applicationService: AdminService,
    private vacancyService: CServiceService
  ){
        // Retrieve user data from localStorage


 //vacancylist
 const vacancylist = localStorage.getItem('currentUser');
 // Check if user data exists
 if (vacancylist) {
   this.cid = JSON.parse(vacancylist);
   console.log("cid ",this.cid.eid)
   this.vacancyService.getVacancyedataCompanyid(this.cid.eid).subscribe(data => {
    // console.log("list student",data);
    this.vacancylist = data.length
  });
 }
 //vacancylist 


// total application list
// Retrieve user data from localStorage
const applicationlist = localStorage.getItem('currentUser');
// Check if user data exists
if (applicationlist) {
  this.cid = JSON.parse(applicationlist);
  // console.log("cid ",this.cid.eid)
  this.applicationService.getVacancyApplybyid(this.cid.eid).subscribe(data => {
   // console.log("list student",data);
   this.applicationlist = data.length
 });
}
// total application list


 

// Student Short List
const ShortList = localStorage.getItem('currentUser');
if (ShortList) {
  this.cid = JSON.parse(ShortList);

  this.applicationService.getVacancyApplybyid(this.cid.eid).subscribe(data => {
    if (data && Array.isArray(data)) {
      // Filter the data and store the count of the filtered items
      const filteredList = data.filter(item => 
        item.Company_ID === this.cid.eid && item.Status === 'Short Listed'
      );
      this.ShortList = filteredList.length;  // Store the count of the filtered list
      // console.log("Short Listed count: ", this.ShortList);  // Debugging the count
    } else {
      console.error("Data from API is not an array or is undefined.");
    }
  }, error => {
    console.error("Error fetching data: ", error); // Error handling
  });
} else {
  console.error("No currentUser found in localStorage.");
}



 
// Student Short List




// Next Round List
const NextRoundList = localStorage.getItem('currentUser');
if (NextRoundList) {
  this.cid = JSON.parse(NextRoundList);
  this.applicationService.getVacancyApplybyid(this.cid.eid).subscribe(data => {
    if (data && Array.isArray(data)) {
      // Filter the data and store the count of the filtered items
      const filteredList = data.filter(item => 
        item.Company_ID === this.cid.eid && item.Status === 'Interview'
      );
      this.NextRoundList = filteredList.length;  // Store the count of the filtered list
      // console.log("Short Listed count: ", this.NextRoundList);  // Debugging the count
    } else {
      console.error("Data from API is not an array or is undefined.");
    }
  }, error => {
    console.error("Error fetching data: ", error); // Error handling
  });
} else {
  console.error("No currentUser found in localStorage.");
}
// Next Round List




// Seleted Student
const Seletedlist = localStorage.getItem('currentUser');
if (Seletedlist) {
  this.cid = JSON.parse(Seletedlist);
  this.applicationService.getVacancyApplybyid(this.cid.eid).subscribe(data => {
    if (data && Array.isArray(data)) {
      // Filter the data and store the count of the filtered items
      const filteredList = data.filter(item => 
        item.Company_ID === this.cid.eid && item.Status === 'Selected'
      );
      this.Seletedlist = filteredList.length;  // Store the count of the filtered list
      // console.log("Short Listed count: ", this.Seletedlist);  // Debugging the count
    } else {
      console.error("Data from API is not an array or is undefined.");
    }
  }, error => {
    console.error("Error fetching data: ", error); // Error handling
  });
} else {
  console.error("No currentUser found in localStorage.");
}
// Seleted Student


// Student Rejected
const Rejectedlist = localStorage.getItem('currentUser');
if (Rejectedlist) {
  this.cid = JSON.parse(Rejectedlist);
  this.applicationService.getVacancyApplybyid(this.cid.eid).subscribe(data => {
    if (data && Array.isArray(data)) {
      // Filter the data and store the count of the filtered items
      const filteredList = data.filter(item => 
        item.Company_ID === this.cid.eid && item.Status === 'Not Selected'
      );
      this.Rejectedlist = filteredList.length;  // Store the count of the filtered list
      // console.log("Short Listed count: ", this.Rejectedlist);  // Debugging the count
    } else {
      console.error("Data from API is not an array or is undefined.");
    }
  }, error => {
    console.error("Error fetching data: ", error); // Error handling
  });
} else {
  console.error("No currentUser found in localStorage.");
}

// Student Rejected
  }
}
