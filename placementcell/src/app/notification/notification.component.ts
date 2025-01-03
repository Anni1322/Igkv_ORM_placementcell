import { Component } from '@angular/core';
import { CServiceService } from '../components/company/service/c-service.service';

import { environment } from '../../environments/environment';




@Component({
  selector: 'app-notification',
  templateUrl: './notification.component.html',
  styleUrls: ['./notification.component.scss']
})
export class NotificationComponent  {

  baseImageUrl: string = environment.baseImageUrl;
  
  data:any;
  user:any;
  constructor(private vacancyService:CServiceService){}
  ngOnInit() {
    const userString = localStorage.getItem('currentUser');
    if (userString !== null) {
      // Proceed only if userString is not null
      this.user = JSON.parse(userString); 
      // console.log('User ID:', userString);
    }
    this.vacancyService.getVacancies().subscribe(data => {
      this.data = data;
      // console.log(data)
      if (data.length > 0) {
        // console.log(data[0].Company_Id); 
      }
    });
}

}
