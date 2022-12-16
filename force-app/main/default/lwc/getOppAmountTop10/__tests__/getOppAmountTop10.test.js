import { createElement } from 'lwc';
import GetOppAmountTop10 from 'c/getOppAmountTop10';

describe('c-get-opp-amount-top10', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('TODO: test case generated by CLI command, please fill in test logic', () => {
        // Arrange
        const element = createElement('c-get-opp-amount-top10', {
            is: GetOppAmountTop10
        });

        // Act
        document.body.appendChild(element);

        // Assert
        // const div = element.shadowRoot.querySelector('div');
        expect(1).toBe(1);
    });
});