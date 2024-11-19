// shared.service.ts
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SharedService {
  sharedFunction() {
    console.log('Shared function called');
  }
}
