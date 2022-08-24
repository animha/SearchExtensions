using System.Linq;

namespace NinjaNye.SearchExtensions
{
    /// <summary>
    /// Added to normalize IQueryable to prevent "The source IQueryable doesn't implement IAsyncEnumerable" excpetion
    /// https://github.com/ninjanye/SearchExtensions/issues/40
    /// </summary>
    public static class ApplyExtension
    {
        public static IQueryable<TSource> Apply<TSource, TProperty>(this QueryableSearchBase<TSource, TProperty> source) {
            return source.Where(source.AsExpression());
        }

        public static IQueryable<TParent> Apply<TParent, TChild, TProperty>(this QueryableChildSearchBase<TParent, TChild, TProperty> source) {
            return source.Where(source.AsExpression());
        }
    }
}
