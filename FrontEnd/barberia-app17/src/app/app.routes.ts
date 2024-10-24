import { Routes } from '@angular/router';
import { LoginPageComponent } from './auth/pages/login-page/login-page.component';
import { isAuthenticatedGuard } from './auth/guards/is-authenticated.guard';

export const routes: Routes = [
  {
    path: 'auth/login',
    component: LoginPageComponent,
  },
  {
    path: 'dashboard',
    loadChildren: () =>
      import('./dashboard/dashboard.routes').then((c) => c.DASHBOARD_ROUTES),
  },
  {
    path: '',
    loadChildren: () => import('./site/site.routes').then((r) => r.SITE_ROUTES),
  },
  {
    path: '**',
    redirectTo: 'home',
  },
];
