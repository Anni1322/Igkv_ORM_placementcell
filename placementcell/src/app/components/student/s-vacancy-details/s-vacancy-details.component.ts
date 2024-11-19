import { Component } from '@angular/core';
import { CServiceService } from '../../company/service/c-service.service';

@Component({
  selector: 'app-s-vacancy-details',
  templateUrl: './s-vacancy-details.component.html',
  styleUrls: ['./s-vacancy-details.component.scss']
})
export class SVacancyDetailsComponent {
  data: any[] = []; // All data
  paginatedVacancies: any[] = []; // Paginated data

  currentPage = 1;
  itemsPerPage = 2; // Set the number of vacancies per page

  totalItems = 0;
  totalPages = 0;

  constructor(private vacancyService: CServiceService) {}

  ngOnInit() {
    this.vacancyService.getVacancies().subscribe(data => {
      this.data = data;
      this.totalItems = this.data.length;
      this.totalPages = Math.ceil(this.totalItems / this.itemsPerPage);
      this.paginateData(); // Paginate data after getting it
    });
  }

  // Paginate data method
  paginateData() {
    const startIndex = (this.currentPage - 1) * this.itemsPerPage;
    const endIndex = startIndex + this.itemsPerPage;
    this.paginatedVacancies = this.data.slice(startIndex, endIndex);
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
}
