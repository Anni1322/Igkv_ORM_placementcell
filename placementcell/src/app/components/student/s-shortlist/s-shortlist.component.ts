import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { StudentService } from 'src/app/services/student.service';
import { SVacancyNextroundApplyComponent } from '../s-vacancy-nextround-apply/s-vacancy-nextround-apply.component';

@Component({
  selector: 'app-s-shortlist',
  templateUrl: './s-shortlist.component.html',
  styleUrls: ['./s-shortlist.component.scss']
})
export class SShortlistComponent implements OnInit {
  vacancyApplications: any[] = []; // Store all applications
  paginatedApplications: any[] = []; // Store paginated applications
  currentPage = 1;
  itemsPerPage = 2; // Number of items per page

  totalItems = 0;
  totalPages = 0;

  studentId: any;
  name: any;



  constructor(
    private applyVacancy: StudentService,
    private route: ActivatedRoute,
    public dialog: MatDialog // Ensure you have MatDialog for dialogs
  ) {}

  ngOnInit(): void {
    // get id from param
    this.studentId = this.route.snapshot.paramMap.get('id')!;
    this.sendstudentid(this.studentId);
    // this.getShortlistCount();
  }



  sendstudentid(eid: any) {
    this.applyVacancy.getAllApplications(eid).subscribe(
      (response) => {
        // Check if response is an object and contains the expected data
        if (response && Array.isArray(response)) {
          this.vacancyApplications = response;
        } else if (response && typeof response === 'object') {
          // If the response is an object and not an array, you might need to handle it differently
          this.vacancyApplications = [response]; // Wrap the single object in an array
        } else {
          console.error('Unexpected response format:', response);
          this.vacancyApplications = []; // Handle unexpected response format
        }
        this.totalItems = this.vacancyApplications.length;
        this.totalPages = Math.ceil(this.totalItems / this.itemsPerPage);
        this.paginateData();
      },
      (error) => {
        console.log('Error:', error);
      }
    );
  }


  getShortlistCount(){
    return this.vacancyApplications.length;
    console.log(this.vacancyApplications.length)
  }
  
  

  // Pagination logic
  paginateData() {
    const startIndex = (this.currentPage - 1) * this.itemsPerPage;
    const endIndex = startIndex + this.itemsPerPage;
    this.paginatedApplications = this.vacancyApplications.slice(startIndex, endIndex);
  }

  // Navigate to the next page
  nextPage() {
    if (this.currentPage < this.totalPages) {
      this.currentPage++;
      this.paginateData();
    }
  }

  // Navigate to the previous page
  previousPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
      this.paginateData();
    }
  }

  // This is the method to handle "Application fill" click
  formNext(rowdata: any): void {
    console.log("Selected row data:", rowdata);

    const dialogRef = this.dialog.open(SVacancyNextroundApplyComponent, {
      width: '490px',
      height: '460px',
      data: { name: rowdata }
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      this.name = result;
    });
  }
}
