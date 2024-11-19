import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { AdminService } from '../../admin/service/admin.service';
import { MatDialog } from '@angular/material/dialog';
import { ExcelExportService } from '../../admin/service/excel-export.service';
 
import Swal from 'sweetalert2';
import { CSApplicationActionComponent } from '../c-s-application-action/c-s-application-action.component';


@Component({
  selector: 'app-c-s-shortlist',
  templateUrl: './c-s-shortlist.component.html',
  styleUrls: ['./c-s-shortlist.component.scss']
})
export class CSShortlistComponent implements OnInit, AfterViewInit {
  cid: any;

  displayedColumns: string[] = [
    'S.No.', 
    //'Student_Application_ID', 
    'Vacancy_ID', 
   // 'Company_ID', 
   // 'Company_Name',
    'Student_ID', 
    'Full_Name', 
    'Post_Name', 
   // 'Fathers_Name', 
    'Email', 
    'Mobile', 
    'Application_Submission_Date', 
    'Status', 
    // 'Resume_Path', 
    // 'Created_By', 
    // 'Created_Date', 
    // 'Modified_By', 
    // 'Modified_Date', 
    // 'Delete_Flag', 
    // 'Flag', 
    // 'Public_IP_Address', 
    // 'Private_IP_Address',
    'edit'
  ];
  
  dataSource = new MatTableDataSource<StudentApplicationDetails>();
  p: number = 1; // for pagination

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  constructor(
    private applicationService: AdminService,
    public dialog: MatDialog,
    private excelExportService: ExcelExportService
    ) {
      // Retrieve user data from localStorage
     const userData = localStorage.getItem('currentUser');
     // Check if user data exists
     if (userData) {
       this.cid = JSON.parse(userData);
       console.log("cid ",this.cid.eid)
       this.applicationService.getVacancyApplybyid(this.cid.eid).subscribe(data => {
        this.dataSource.data = data;
        // console.log("list student",this.dataSource.data);
        // console.log("list student",data);
      });

     }
    }

 
    

    ngOnInit() {
      // this.applicationService.getshortlist().subscribe(
      //   (response: any) => {
      //     // Assuming response from API contains both records and selectedCount
      //     this.dataSource.data = response;
      //     console.log("Response:", response);
      //     // console.log("Selected Count:", response.selectedCount);
      //   },
      //   error => {
      //     console.error('Error fetching selected applications:', error);
      //     // Handle error as needed
      //   }
      // );
      if (this.cid && this.cid.eid) {
        this.applicationService.getshortlist().subscribe(data => {
          this.dataSource.data = data.filter(item => item.Company_ID === this.cid.eid && item.Status === 'Short Listed');
          console.log("Filtered response", this.dataSource.data);
        });
      }
     
    }
    
 
  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }


  filterValue: string = '';


  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }


  


  printTable() {
    const printContent = document.getElementById('print-section');
    const WindowPrt = window.open('', '', 'width=900,height=650');
    WindowPrt!.document.write(printContent!.outerHTML);
    WindowPrt!.document.close();
    WindowPrt!.focus();
    WindowPrt!.print();
    WindowPrt!.close();
  }

  name!: String;

  onedit(rowdata: any): void {
    console.log("rowid", rowdata);
    
    // data send on service
    // Set row data in the service
    this.applicationService.setRowData(rowdata);

     // Log the row data
     this.applicationService.getRowData().subscribe(data => {
      console.log("data received", data);
      // You can handle the data here if needed
    }, error => {
      console.error("Error fetching row data", error);
    });
  
    // Assuming Vacancy_ID contains the data you want to pass to the dialog
    const dialogRef = this.dialog.open(CSApplicationActionComponent, {
      width: '650px',
      data: { name: rowdata }
    });
  
    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      this.name = result;
    });
  }
  

  onedelete(rowid:any){
    Swal.fire("delete successfully");
    console.log(rowid);
  }

  scrollToBottom(){
    
  }
  editApplication(element: StudentApplicationDetails) {
    // Implement the edit logic here
    console.log('Edit application:', element);
  }



  enableEditing(row: any) {
    row.editing = true;
  }

  saveEditing(row: any) {
    row.editing = false;
 
  }

  // excel

  exportTableToExcel(): void {
    this.excelExportService.exportAsExcelFile(this.dataSource.data, 'applications');
  }

}
 

// Interface for Student Application Details
export interface StudentApplicationDetails {
  Student_Application_ID?: number;  // Optional since it's auto-incremented
  Vacancy_ID: string;
  Company_ID?: string;
  Company_Name?: string;
  Student_ID?: string;
  Application_Submission_Date?: Date;  // Optional with default value
  Full_Name?: string;
  Post_Name?: string;
  //Fathers_Name?: string;
  Email?: string;
  Mobile?: string;
  Status?: string;  // Optional with default value
  // Resume_Path?: string;
  // Created_By?: string;
  // Created_Date?: Date;  // Optional with default value
  // Modified_By?: string;
  // Modified_Date?: Date;
  // Delete_Flag?: string;
  Flag?: string;
  // Public_IP_Address?: string;
  // Private_IP_Address?: string;
}

//s-shortlist apply the company id match to the view only the shortlisted student applications 
//this is show all the student application 

