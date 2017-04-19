import {NgModule, Optional, SkipSelf} from '@angular/core';
import { CommonModule } from '@angular/common';

import { ApiService } from "./api.service";
import { SpinnerService } from "./spinner/spinner.service";

@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [ ],
  providers: [ ApiService, SpinnerService ]
})
export class CoreModule {
  constructor (@Optional() @SkipSelf() parentModule: CoreModule) {
    if (parentModule) {
      throw new Error('CoreModule is already loaded. Import it in the AppModule only');
    }
  }
}
