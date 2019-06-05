package lcs

class Main {


    static def sequenceA = "absfcdsfefg"
    static def sequenceB = "bcdsdfsfdefgh"
    
    
    static def main(def args) {
        StringBuilder maxCommonSubsequenceStringBuilder = new StringBuilder()
        getMaxCommonSubsequence(sequenceA, sequenceB, maxCommonSubsequenceStringBuilder)
        println(maxCommonSubsequenceStringBuilder.toString())
    }
    
    static void getMaxCommonSubsequence(String a, String b, StringBuilder commonSubsequenceStringBuilder) {
      
        if (a.length() == 0 || b.length() == 0) {
            return
        }

        if (a[a.length() - 1] == b[b.length() - 1]) {
            commonSubsequenceStringBuilder.insert(0, String.valueOf(a[a.length() - 1]))
            StringBuilder subStringBuilder = new StringBuilder()
            getMaxCommonSubsequence(a.substring(0, a.length() - 1), b.substring(0, b.length() - 1), subStringBuilder)
            commonSubsequenceStringBuilder.insert(0, subStringBuilder.toString())
        } else {
            StringBuilder subStringBuilder1 = new StringBuilder()
            if (a.length() > 1) {
                getMaxCommonSubsequence(a.substring(0, a.length() - 1), b, subStringBuilder1)
            }

            StringBuilder subStringBuilder2 = new StringBuilder()
            if (b.length() > 1) {
                getMaxCommonSubsequence(a, b.substring(0, b.length() - 1), subStringBuilder2)
            }

            if (subStringBuilder1.length() > subStringBuilder2.length()) {
                commonSubsequenceStringBuilder.insert(0, subStringBuilder1.toString())
            } else {
                commonSubsequenceStringBuilder.insert(0, subStringBuilder2.toString())
            }

        }

    }

}
