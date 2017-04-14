import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ApiService } from "./api.service";
import { SpinnerService } from "./spinner/spinner.service";

@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [],
  providers: [ ApiService, SpinnerService ]
})
export class CoreModule { }
