import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, AbstractControl } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-forget',
  templateUrl: './forget.component.html',
  styleUrls: ['./forget.component.scss']
})
export class ForgetComponent implements OnInit {
  forgotPasswordForm: FormGroup;

  captchaImage!: string;
  captchaValue:any;

  constructor(private fb: FormBuilder, private auth: AuthService, private router: Router ) {
    this.forgotPasswordForm = this.fb.group({
      username: ['', Validators.required],
      UID: ['', Validators.required],
      // password: ['', Validators.required],
      newpassword: ['', Validators.required],
      captcha: ['', Validators.required]
    }, 
    // { validator: this.passwordsMatchValidator }
    );
  }

  ngOnInit(): void {
    this.loadCaptcha();
  }


  loadCaptcha() {
    this.auth.getcaptcha().subscribe(
      (data: any) => {
        this.captchaImage = `data:image/svg+xml;base64,${btoa(data.image)}`;
        // console.log(this.captchaImage);
         this.captchaValue = data.capvalue;
        // console.log(this.captchaValue); // Log captcha value
      },
      (error) => {
        console.error('Error loading CAPTCHA:', error);
      }
    );
  }



  onSubmit(): void {
    if (this.forgotPasswordForm.valid) {
      const formData = this.forgotPasswordForm.value;

        // Check if CAPTCHA matches
        if (formData.captcha !== this.captchaValue) {
          Swal.fire("CAPTCHA does not match. Please try again.");
          return;
        }


      this.auth.forgetPassword(formData).subscribe(response => {
        if (response) {
          Swal.fire('Success', 'Password reset successfully', 'success');
          this.forgotPasswordForm.reset();
          this.router.navigate(['/login']);
        } else {
          Swal.fire('Error', 'Failed to reset password', 'error');
        }
      });
    } else {
      console.error('Forgot Password Form is invalid');
    }
  }
  

  passwordsMatchValidator(control: AbstractControl): { [key: string]: boolean } | null {
    const password = control.get('password')?.value;
    const newpassword = control.get('newpassword')?.value;

    if (password && newpassword && password === newpassword) {
      Swal.fire({
        icon: 'error',
        title: 'Passwords Match',
        text: 'New password cannot be the same as the old password. Please choose a different one.'
      });
      return { 'passwordsMatch': true };
    }
    return null;
  }
}
