package deck;
import java.util.ArrayList;
import java.util.Random;

public class Deck
    {
        public static final int NUM_CARDS = 52;
        ArrayList<PlayingCard> deck = new ArrayList<PlayingCard>();
        Random generator = new Random();

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
                for(int i = 0; i < 13; i++)
                    {
                        for(int j = 0; j < 4; j++)
                            {
                                PlayingCard card = new PlayingCard(Rank(i), null)
                            }
                    }
            }

        public void shuffleDeck()
            {

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
                        r += deck.get(i).toString() + "/n";
                    }
                return r;
            }
    }