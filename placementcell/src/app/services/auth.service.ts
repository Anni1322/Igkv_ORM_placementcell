import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import * as CryptoJS from 'crypto-js';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3000/student';  

  private secretKey = 'your-secret-key';

  constructor(
    private http: HttpClient
    ) {}


    getcaptcha(){
      return this.http.get(`${this.apiUrl}/captcha`);
    }
// add by anil this api for master table
 


  login(loginData: any): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/login`, loginData).pipe(
      map(response => {
        // Store user details and token in local storage
        localStorage.setItem('currentUser', JSON.stringify(response));
        if (response && response.userId) {
          // localStorage.setItem('userId', response.userId);
        }
        return response;
      }),
      catchError(error => {
        // Handle login errors (e.g., display error message)
        console.error('Login error:', error);
        return of(null);
      })
    );
  }


    // Forgot Password function
  forgetPassword(forgotPasswordData: any): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/forgetPassword`, forgotPasswordData).pipe(
      map(response => {
        console.log('Forgot Password response:', response);
        return response;
      }),
      catchError(error => {
        console.error('Forgot Password error:', error);
        return of(null);
      })
    );
  }




  logout(): void {
    // Remove user from local storage or cookie
    localStorage.removeItem('currentUser');
    
  }



  // Method to get the token
  getToken(): string | null {
    return localStorage.getItem('Token');
  }



  // for auth 
  // isAuthenticated(){
  //   const userData = localStorage.getItem('currentUser');
  //   // console.log("profiledata"+ userData)
  //   return true
  // }


  isAuthenticated(): boolean {
    const encryptedUser = localStorage.getItem('currentUser');
    if (encryptedUser) {
      // const decryptedUser = this.decryptData(encryptedUser);
      const user = JSON.parse(encryptedUser);
  
      // Check if user has a role and return true if authenticated
      return user && user.role ? true : false;
    }
    return false;
  }
  
  // Get user role (admin, student, company)
  getUserRole(): number | null {
    const encryptedUser = localStorage.getItem('currentUser');
    if (encryptedUser) {
      // const decryptedUser = this.decryptData(encryptedUser);
      const user = JSON.parse(encryptedUser);
  
      // Return role of the user (admin = 3, student = 1, company = 2)
      return user.role;
    }
    return null;
  }
  
  // for auth 


  

  // Implement other authentication-related methods such as registration, logout, etc.



  // for incription login store local storeage
    // Encrypt data
    encryptData(data: string): string {
      try {
        return CryptoJS.AES.encrypt(data, this.secretKey).toString();
      } catch (e) {
        console.error('Error encrypting data', e);
        return '';
      }
    }
  
    // Decrypt data

    // decryptData(encryptedData: string): string {
    //   try {
    //     const bytes = CryptoJS.AES.decrypt(encryptedData, this.secretKey);
    //     return bytes.toString(CryptoJS.enc.Utf8);
    //   } catch (e) {
    //     console.error('Error decrypting data', e);
    //     return '';
    //   }
    // }
  
    // Your login method with encryption

    // login(loginData: any): Observable<any> {
    //   return this.http.post<any>(`${this.apiUrl}/login`, loginData).pipe(
    //     map(response => {
    //       if (response) {
    //         // Encrypt the user details and token
    //         const encryptedUser = this.encryptData(JSON.stringify(response));
    //         localStorage.setItem('currentUser', encryptedUser);
            
    //         if (encryptedUser) {
    //           // Optionally encrypt userId separately if needed
    //           const encryptedUserId = this.encryptData(encryptedUser);
    //           localStorage.setItem('userId', encryptedUserId);
    //         }
    //       }
    //       return response;
    //     }),
    //     catchError(error => {
    //       console.error('Login error:', error);
    //       return of(null);
    //     })
    //   );
    // }
  
    // Retrieve and decrypt currentUser from localStorage
  // Retrieve and decrypt currentUser from localStorage

  // getCurrentUser(): any {
  //   const encryptedUser = localStorage.getItem('currentUser');
  //   if (encryptedUser) {
  //     const decryptedUser = this.decryptData(encryptedUser);
  //     return JSON.parse(decryptedUser);
  //   }
  //   return null;
  // }

  // for incription login store local storeage


  // decription
  // Decrypt data

// decryptData(encryptedData: string): string {
//   try {
//     const bytes = CryptoJS.AES.decrypt(encryptedData, this.secretKey);
//     return bytes.toString(CryptoJS.enc.Utf8);  // Convert to UTF-8 format after decryption
//   } catch (e) {
//     console.error('Error decrypting data', e);
//     return '';
//   }
// }

  // decription

}
