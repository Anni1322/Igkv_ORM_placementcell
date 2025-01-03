import { Component } from '@angular/core';
import { CServiceService } from '../service/c-service.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-c-add-vacancy-details',
  templateUrl: './c-add-vacancy-details.component.html',
  styleUrls: ['./c-add-vacancy-details.component.scss']
})
export class CAddVacancyDetailsComponent {
  // formData: any = {};
  formData: FormGroup;
  companayid:any;
  vancancydata:any;
  logoFile:any;
  Noticepdf:any;

  constructor(
    private ds:CServiceService, 
   
    private fb: FormBuilder, 
    private router: Router
    ){
    this.formData = this.fb.group({
      // Vacancy_ID: ['', Validators.required],
      Company_Id: ['', Validators.required],
      Company_Name: ['', Validators.required],
      Company_Registration_No: ['', Validators.required],
      Job_Title: ['', Validators.required],
      Job_Description: [''],
      Job_Selection: ['', Validators.required],
      Job_Location: ['', Validators.required],
      No_Of_Post: ['', Validators.required],
      Salary: ['', Validators.required],
      Last_Date_for_apply: ['', Validators.required],
      Min_Experience_in_Year: ['', Validators.required],
      Maximum_Age: ['', Validators.required],
      Preferred_Gender: ['', Validators.required],
      Prefered_Language: ['', Validators.required],
      Notice_Url: [''],
      Status: ['Pending']
    //  Created_Date: [new Date()]
    });

       // Retrieve user data from localStorage
       const companayData = localStorage.getItem('currentUser');
       // Check if vacacnyData data exists
       if (companayData) {
         // Parse vacacnyData data from JSON and assign it to the vacacnyData variable
         this.companayid = JSON.parse(companayData);
         // console.log("Data",this.vacacnyid.eid)
         this.formData.patchValue({
          Company_Id: this.companayid.eid,
          Company_Name: this.companayid.username,
          Company_Registration_No: this.companayid.eid
        })
       }
  }
  
  nopath(){
    Swal.fire("please select a file","","warning")
  }

 // logo file upload 
     selectLogo(event: any) {
      if (event.target.files.length > 0) {
        const file1 = event.target.files[0];            //it is used to get the input file dom property
        this.logoFile = file1
      }
  }

//upload logo
NoticePdfFile(){                            
    if(!this.logoFile){
      return this.nopath();
    }
    const LogoformData = new FormData();
    LogoformData.append('Notice_Url', this.logoFile);
    // console.log(this.logoFile)
    this.ds.uploadNotice_Url(LogoformData).subscribe((result:any=[])=>{
      //  console.log(result.body.Notice_Url);
      // console.log(result);
      this.Noticepdf = result.body.Notice_Url;
      this.formData.patchValue({
        Notice_Url: this.Noticepdf,
      });
      Swal.fire("Nocice uploaded successfully")
      //this.iseditmode=false;
    });
    
}


  getvalueFromform() {
    if (this.formData.valid) {
      const formAllData = this.formData.value;
      // console.log(this.formData.value);
      this.ds.postVacancies(formAllData).subscribe((Response)=>{
        this.vancancydata = Response
        // console.log(this.vancancydata);
        alert(this.vancancydata.message);
       // Navigate first, then reset the form
       this.router.navigate(['/company/c-status']).then(() => {
        this.formData.reset();
      });
      },(error) => {
        console.error('Error submitting form:', error);
      })
    }
  }
  

  
  }
