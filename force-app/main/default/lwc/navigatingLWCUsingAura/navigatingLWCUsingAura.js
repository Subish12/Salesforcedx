import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavigatingLWCUsingAura extends NavigationMixin(LightningElement){
    handleNavigation() {
        this[NavigationMixin.Navigate]({
            type: "standard__component",
            attributes: {
                componentName: "c__connectingLWCAura"
            },
            state: {
                c__propertyValue: '1000'
            }
        });
    }
}