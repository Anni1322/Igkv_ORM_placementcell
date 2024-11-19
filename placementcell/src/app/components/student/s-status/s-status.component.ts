import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { StudentService } from 'src/app/services/student.service';
import { SVacancyNextroundApplyComponent } from '../s-vacancy-nextround-apply/s-vacancy-nextround-apply.component';
import { MatDialog } from '@angular/material/dialog';


// for dialog box
export interface DialogData {
  name: string;
}



@Component({
  selector: 'app-s-status',
  templateUrl: './s-status.component.html',
  styleUrls: ['./s-status.component.scss']
})
export class SStatusComponent implements OnInit {
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
    // get id form param
    this.studentId = this.route.snapshot.paramMap.get('id')!;
    this.sendstudentid(this.studentId);
  }

  sendstudentid(eid: any) {
    this.applyVacancy.VacancyApplicationStudentDetail(eid).subscribe(
      (response) => {
        this.vacancyApplications = response;
        this.totalItems = this.vacancyApplications.length;
        this.totalPages = Math.ceil(this.totalItems / this.itemsPerPage);
        this.paginateData();
      },
      (error) => {
        console.log('Error:', error);
      }
    );
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

  // This is the missing method to handle "Application fill" click
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



//remove student id and add company id and company name 
