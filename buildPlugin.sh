while getopts i:o: flag
do
    case "${flag}" in
        i) input=${OPTARG};;
        o) output=${OPTARG};;
    esac
done

if [[ -z "$input" || -z "$output" ]]; then
    printf "\nMissing required parameter.\n"
    printf "  syntax: buildPlugin.sh -i <path to input file> -o <path to output file>\n\n"
    exit 1
fi

npx esbuild $input --format=esm --keep-names --bundle --outfile=$output