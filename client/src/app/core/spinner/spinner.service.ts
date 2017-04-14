import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';

@Injectable()
export class SpinnerService {
  active: BehaviorSubject<boolean>;

  constructor() {
    this.active = new BehaviorSubject<boolean>(false);
  }

  activate(): void {
    this.active.next(true);
  }

  deactivate(): void {
    this.active.next(false);
  }
}
