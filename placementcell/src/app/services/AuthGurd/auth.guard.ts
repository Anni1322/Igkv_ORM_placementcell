import { CanActivateFn } from '@angular/router';
import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../auth.service';

export const authGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthService); // Use Angular's inject function
  const router = inject(Router); // Inject Router to navigate

  if (authService.isAuthenticated()) {
    // Get the required role from the route data
    const requiredRole = route.data['role'];
    const userRole = authService.getUserRole(); // Get the current user's role

    if (userRole === requiredRole) {
      return true; // User has the required role, allow access
    } else {
      router.navigate(['/access-denied']); // Redirect to access denied page if role doesn't match
      return false; // User doesn't have the required role
    }
  } else {
    router.navigate(['/login']); // Redirect to login page if not authenticated
    return false; // User is not authenticated
  }
};
