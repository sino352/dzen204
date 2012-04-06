
public class Iteration {
	private boolean shouldBeName = false;
	private boolean shouldBeValue = false;
	private boolean canBeComma = false;
	public boolean shouldBeName() {
		return shouldBeName;
	}
	public void shouldBeName(boolean shouldBeName) {
		this.shouldBeName = shouldBeName;
	}
	public boolean shouldBeValue() {
		return shouldBeValue;
	}
	public void shouldBeValue(boolean shouldBeValue) {
		this.shouldBeValue = shouldBeValue;
	}
	public boolean canBeComma() {
		return canBeComma;
	}
	public void canBeComma(boolean canBeComma) {
		this.canBeComma = canBeComma;
	}
}
