package deck;
import java.util.ArrayList;
import java.util.Random;

public class Deck
    {
        public static final int NUM_CARDS = 52;
        private ArrayList<PlayingCard> deck;
        private Random generator;

        public Deck()
            {
                generator = new Random();
                initialize();
            }

        public Deck(int seed)
            {
                generator = new Random(seed);
                initialize();
            }

        public void initialize()
            {
                PlayingCard temp;
                deck = new ArrayList<>();
                for(Rank r : Rank.values()) 
                    {
                        for(Suit s : Suit.values())
                            {
                                temp = new PlayingCard(r, s);
                                deck.add(temp);
                            }
                    }
            }

        public void shuffleDeck()
            {
                PlayingCard temp;
                for(int i = deck.size() - 1; i > 0; i--)
                    {
                        int randTemp = generator.nextInt(i);
                        temp = deck.get(i);
                        deck.set(i, deck.get(randTemp));
                        deck.set(randTemp, temp);
                    }
            }

        public PlayingCard getCard(int index)
            {
                return deck.get(index);
            }

        public String toString()
            {
                String r = "";
                for(int i = 0; i < deck.size(); i++)
                    {
                        r += deck.get(i).toString() + "\n";
                    }
                return r.substring(0, r.length() - 1);
            }
    }