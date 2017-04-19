import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from "@angular/forms";
import { SharedModule } from '../shared/shared.module';
import { UsersComponent } from './users/users.component';
import { UserComponent } from './user/user.component';
import { SnComponent } from './sn/sn.component';


@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    SharedModule
  ],
  declarations: [
    UsersComponent,
    UserComponent,
    SnComponent
  ]
})
export class UsersModule { }
