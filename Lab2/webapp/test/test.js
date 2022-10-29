var expect = require('chai').expect;

describe('tests', function() {

  context('0 equals 0', function() {
    it('should be equal', function() {
      expect(0).to.equal(0)
    })
  })

  context('1 + 1', function() {
    it('should be equal', function() {
      expect(1 + 1).to.equal(2)
    })
  })

  context('Hello World', function() {
    it('should be equal', function() {
      expect("Hello World").to.equal("Hello World")
    })
  })

})