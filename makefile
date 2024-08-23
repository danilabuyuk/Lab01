JUNIT5_JAR = lib/junit-platform-console-standalone-1.8.2.jar
TEST_UTILS = lib/LabTests.jar
JUNIT5_RUNNER = org.junit.platform.console.ConsoleLauncher
CKSTYLE_COMMAND =  -jar lib/checkstyle-10.5.0-all.jar
JAVAC_FLAGS = -d bin -cp src/main:src/tests:$(JUNIT5_JAR):$(TEST_UTILS)
JUNIT_FLAGS = -jar $(JUNIT5_JAR) -cp bin:$(TEST_UTILS) --select-class

default: 
	@echo "usage: make target"
	@echo "____________________ rank - compile and run Rank tests"
	@echo "____________________ suit - compile and run Suit tests"
	@echo "____________________ playingCard - compile and run PlayingCard tests"
	@echo "____________________ deck - compile and run Deck tests"
	@echo "____________________ test - compile and run all tests"
	@echo "____________________ demo - compile and run the demo"
	@echo "____________________ check - runs checkstyle"
	@echo "____________________ compile - compiles all classes"
	@echo "____________________ clean - removes all .class files"

rank:
	javac11 $(JAVAC_FLAGS) src/*/deck/Rank*.java
	java11 $(JUNIT_FLAGS) deck.RankTest

suit:
	javac11 $(JAVAC_FLAGS) src/*/deck/Suit*.java
	java11 $(JUNIT_FLAGS) deck.SuitTest

playingCard:
	javac11 $(JAVAC_FLAGS) src/*/deck/PlayingCard*.java
	java11 $(JUNIT_FLAGS) deck.PlayingCardTest

deck:
	javac11 $(JAVAC_FLAGS) src/*/deck/Deck*.java
	java11 $(JUNIT_FLAGS) deck.DeckTest

compile:
	javac11 $(JAVAC_FLAGS) src/**/**/*.java

test:
	make compile
	java11 -cp bin:$(JUNIT5_JAR):$(TEST_UTILS) $(JUNIT5_RUNNER) --scan-class-path
	
demo:
	make compile
	java11 -cp .:bin client.Demo

check:
	java11 $(CKSTYLE_COMMAND) -c resources/styles.xml src/main/**/*.java

submit:
	./lib/webcatSubmit src/main	

clean:
	rm -f ./bin/**/*.class
